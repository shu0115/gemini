class MailTemplatesController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @mail_templates = MailTemplate.paginate( :conditions => { :user_id => session[:user_id] }, :page => params[:page], :per_page => $per_page, :order => "created_at DESC" )
  end

  #------#
  # show #
  #------#
  def show
    @mail_template = MailTemplate.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )
  end

  #-----#
  # new #
  #-----#
  def new
    @mail_template = MailTemplate.new
  end

  #------#
  # edit #
  #------#
  def edit
    @mail_template = MailTemplate.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )
  end

  #--------#
  # create #
  #--------#
  def create
    @mail_template = MailTemplate.new( params[:mail_template] )
    @mail_template.user_id = session[:user_id]

    if @mail_template.save
      redirect_to :action => "index" and return
    else
      render :action => "new"
    end
  end

  #--------#
  # update #
  #--------#
  def update
    @mail_template = MailTemplate.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )

    if @mail_template.update_attributes( params[:mail_template] )
      redirect_to :action => "index", :page => params[:page] and return
    else
      render :action => "edit"
    end
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    @mail_template = MailTemplate.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )

    redirect_to :action => "index" and return if @mail_template.blank?

    unless @mail_template.destroy
      flash[:notice] = "メールテンプレートの削除に失敗しました。"
    end
    
    redirect_to :action => "index", :page => params[:page] and return
  end

end
