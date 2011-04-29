class ReceptionsController < ApplicationController

  #------#
  # form #
  #------#
  def form
    @event_id = params[:id]
    @reception = Reception.new
    
    render :layout => false
  end

  #-------#
  # reply #
  #-------#
  def reply
    reception = Reception.new( params[:reception] )

    # 返信メール送信
    reception[:result] = SendMail.deliver_reception_reply( params[:reception] )

    # 送信時刻
    reception[:mail_send_at] = Time.now

    # 受付データ保存
    reception.save

    render :layout => false
  end

  #-------#
  # index #
  #-------#
  def index
    @receptions = Reception.paginate( :page => params[:page], :per_page => $per_page, :order => "mail_send_at DESC" )    
  end

  #---------#
  # destroy #
  #---------#
  def destroy
    @reception = Reception.find(params[:id])
    @reception.destroy

    flash[:notice] = '申込受付を削除しました。'
    redirect_to :action => "list"
  end

end
