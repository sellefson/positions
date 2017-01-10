class SeatsController < ApplicationController
  def index
    @seats = Seat.page(params[:page]).per(10)

    render("seats/index.html.erb")
  end

  def show
    @seat = Seat.find(params[:id])

    render("seats/show.html.erb")
  end

  def new
    @seat = Seat.new

    render("seats/new.html.erb")
  end

  def create
    @seat = Seat.new

    @seat.official_id = params[:official_id]
    @seat.position_id = params[:position_id]

    save_status = @seat.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/seats/new", "/create_seat"
        redirect_to("/seats")
      else
        redirect_back(:fallback_location => "/", :notice => "Seat created successfully.")
      end
    else
      render("seats/new.html.erb")
    end
  end

  def edit
    @seat = Seat.find(params[:id])

    render("seats/edit.html.erb")
  end

  def update
    @seat = Seat.find(params[:id])

    @seat.official_id = params[:official_id]
    @seat.position_id = params[:position_id]

    save_status = @seat.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/seats/#{@seat.id}/edit", "/update_seat"
        redirect_to("/seats/#{@seat.id}", :notice => "Seat updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Seat updated successfully.")
      end
    else
      render("seats/edit.html.erb")
    end
  end

  def destroy
    @seat = Seat.find(params[:id])

    @seat.destroy

    if URI(request.referer).path == "/seats/#{@seat.id}"
      redirect_to("/", :notice => "Seat deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Seat deleted.")
    end
  end
end
