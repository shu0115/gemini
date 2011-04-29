class SentMailsController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @sent_mails = SentMail.paginate( :conditions => { :operation_user_id => session[:user_id] }, :page => params[:page], :per_page => $per_page, :order => "created_at DESC" )
  end

  #------#
  # show #
  #------#
  def show
    @sent_mail = SentMail.first( :conditions => { :id => params[:id], :operation_user_id => session[:user_id] } )
  end

  #-----#
  # new #
  #-----#
  def new
    unless params[:sent_mail].blank?
      # テンプレート取得
      template = MailTemplate.first( :conditions => { :id => params[:sent_mail][:mail_template_id], :user_id => session[:user_id] } )
    end

    unless template.blank?
      # テンプレート読込
      @sent_mail = SentMail.new_from_template( template )
    else
      @sent_mail = SentMail.new
    end
  end

  #------#
  # edit #
  #------#
  def edit
    @sent_mail = SentMail.first( :conditions => { :id => params[:id], :operation_user_id => session[:user_id] } )
  end

  #--------#
  # create #
  #--------#
  def create
    @sent_mail = SentMail.new( params[:sent_mail] )
    @sent_mail.operation_user_id = session[:user_id]

    if @sent_mail.save
      # テンプレート登録
      if params[:add_template] == "YES"
        mail_template = MailTemplate.new_from_sent_mail( params[:sent_mail] )
        mail_template.user_id = session[:user_id]
        mail_template.save
      end
      
      redirect_to :action => "index" and return
    else
      render :action => "new"
    end
  end

  #--------#
  # update #
  #--------#
  def update
    @sent_mail = SentMail.first( :conditions => { :id => params[:id], :operation_user_id => session[:user_id] } )

    if @sent_mail.update_attributes( params[:sent_mail] )
      redirect_to :action => "index", :page => params[:page] and return
    else
      render :action => "edit"
    end
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    @sent_mail = SentMail.first( :conditions => { :id => params[:id], :operation_user_id => session[:user_id] } )

    redirect_to :action => "index" and return if @sent_mail.blank?

    unless @sent_mail.destroy
      flash[:notice] = "送信済みメールの削除に失敗しました。"
    end
    
    redirect_to :action => "index", :page => params[:page] and return
  end

  #------------#
  # get_member #
  #------------#
  def get_member
    print "[ params[:sent_mail] ] : "; p params[:sent_mail] ;
    @members = GroupMember.all( :conditions => { :group_id => params[:sent_mail][:group_id] }, :select => "name", :order => "name ASC" )
    render :layout => false
  end

end
