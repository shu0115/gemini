class GroupMembersController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @members = GroupMember.paginate( :conditions => { :group_id => params[:group_id] }, :page => params[:page], :per_page => $per_page, :order => "created_at DESC" )
  end

  #------#
  # show #
  #------#
  def show
    @member = GroupMember.find_by_id( params[:id] )
  end

  #-----#
  # new #
  #-----#
  def new
    @member = GroupMember.new
  end

  #------#
  # edit #
  #------#
  def edit
    @member = GroupMember.find_by_id( params[:id] )
  end

  #--------#
  # create #
  #--------#
  def create
    @member = GroupMember.new( params[:member] )

    if @member.save
      redirect_to :action => "index", :group_id => @member.group_id, :group_page => params[:group_page] and return
    else
      render :action => "new"
    end
  end

  #--------#
  # update #
  #--------#
  def update
    @member = GroupMember.find_by_id( params[:id] )

    if @member.update_attributes( params[:group_member] )
      redirect_to :action => "index", :group_id => @member.group_id, :page => params[:page], :group_page => params[:group_page] and return
    else
      render :action => "edit"
    end
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    @member = GroupMember.find_by_id( params[:id] )

    redirect_to :action => "index" and return if @member.blank?

    unless @member.destroy
      flash[:notice] = "メンバーの削除に失敗しました。"
    end
    
    redirect_to :action => "index", :group_id => @member.group_id, :page => params[:page], :group_page => params[:group_page] and return
  end

end
