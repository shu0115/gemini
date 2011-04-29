class GroupsController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @groups = Group.paginate( :conditions => { :user_id => session[:user_id] }, :page => params[:page], :per_page => $per_page, :order => "created_at DESC" )
  end

  #------#
  # show #
  #------#
  def show
    @group = Group.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )
  end

  #-----#
  # new #
  #-----#
  def new
    @group = Group.new
  end

  #------#
  # edit #
  #------#
  def edit
    @group = Group.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )
  end

  #--------#
  # create #
  #--------#
  def create
    @group = Group.new( params[:group] )
    @group.user_id = session[:user_id]

    if @group.save
      redirect_to :action => "index" and return
    else
      render :action => "new"
    end
  end

  #--------#
  # update #
  #--------#
  def update
    @group = Group.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )

    if @group.update_attributes( params[:group] )
      redirect_to :action => "index", :page => params[:page] and return
    else
      render :action => "edit"
    end
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    @group = Group.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )

    redirect_to :action => "index" and return if @group.blank?

    unless @group.destroy
      flash[:notice] = "グループの削除に失敗しました。"
    end
    
    redirect_to :action => "index", :page => params[:page] and return
  end

end
