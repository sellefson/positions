class PositionsController < ApplicationController
  def index
    @q = Position.ransack(params[:q])
    @positions = @q.result(:distinct => true).includes(:seats, :district, :elected_positions).page(params[:page]).per(10)

    render("positions/index.html.erb")
  end

  def show
    @seat = Seat.new
    @position = Position.find(params[:id])

    render("positions/show.html.erb")
  end

  def new
    @position = Position.new

    render("positions/new.html.erb")
  end

  def create
    @position = Position.new

    @position.name = params[:name]
    @position.district_id = params[:district_id]

    save_status = @position.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/positions/new", "/create_position"
        redirect_to("/positions")
      else
        redirect_back(:fallback_location => "/", :notice => "Position created successfully.")
      end
    else
      render("positions/new.html.erb")
    end
  end

  def edit
    @position = Position.find(params[:id])

    render("positions/edit.html.erb")
  end

  def update
    @position = Position.find(params[:id])

    @position.name = params[:name]
    @position.district_id = params[:district_id]

    save_status = @position.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/positions/#{@position.id}/edit", "/update_position"
        redirect_to("/positions/#{@position.id}", :notice => "Position updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Position updated successfully.")
      end
    else
      render("positions/edit.html.erb")
    end
  end

  def destroy
    @position = Position.find(params[:id])

    @position.destroy

    if URI(request.referer).path == "/positions/#{@position.id}"
      redirect_to("/", :notice => "Position deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Position deleted.")
    end
  end
end
