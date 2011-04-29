class EventsController < ApplicationController

  #-------#
  # index #
  #-------#
  def index
    @events = Event.paginate( :conditions => { :user_id => session[:user_id] }, :page => params[:page], :per_page => $per_page, :order => "created_at DESC" )
  end

  #------#
  # show #
  #------#
  def show
    @event = Event.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )
  end

  #-----#
  # new #
  #-----#
  def new
    @event = Event.new
  end

  #------#
  # edit #
  #------#
  def edit
    @event = Event.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )
  end

  #--------#
  # create #
  #--------#
  def create
    @event = Event.new( params[:event] )
    @event.user_id = session[:user_id]

    if @event.save
      redirect_to :action => "index" and return
    else
      render :action => "new"
    end
  end

  #--------#
  # update #
  #--------#
  def update
    @event = Event.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )

    if @event.update_attributes( params[:event] )
      redirect_to :action => "index", :page => params[:page] and return
    else
      render :action => "edit"
    end
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    @event = Event.first( :conditions => { :id => params[:id], :user_id => session[:user_id] } )

    redirect_to :action => "index" and return if @event.blank?

    unless @event.destroy
      flash[:notice] = "イベントの削除に失敗しました。"
    end
    
    redirect_to :action => "index", :page => params[:page] and return
  end

end
