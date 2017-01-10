class ElectedofficialsController < ApplicationController
  def index
    @electedofficials = Electedofficial.all

    render("electedofficials/index.html.erb")
  end

  def show
    @electedofficial = Electedofficial.find(params[:id])

    render("electedofficials/show.html.erb")
  end

  def new
    @electedofficial = Electedofficial.new

    render("electedofficials/new.html.erb")
  end

  def create
    @electedofficial = Electedofficial.new

    @electedofficial.name = params[:name]

    save_status = @electedofficial.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/electedofficials/new", "/create_electedofficial"
        redirect_to("/electedofficials")
      else
        redirect_back(:fallback_location => "/", :notice => "Electedofficial created successfully.")
      end
    else
      render("electedofficials/new.html.erb")
    end
  end

  def edit
    @electedofficial = Electedofficial.find(params[:id])

    render("electedofficials/edit.html.erb")
  end

  def update
    @electedofficial = Electedofficial.find(params[:id])

    @electedofficial.name = params[:name]

    save_status = @electedofficial.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/electedofficials/#{@electedofficial.id}/edit", "/update_electedofficial"
        redirect_to("/electedofficials/#{@electedofficial.id}", :notice => "Electedofficial updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Electedofficial updated successfully.")
      end
    else
      render("electedofficials/edit.html.erb")
    end
  end

  def destroy
    @electedofficial = Electedofficial.find(params[:id])

    @electedofficial.destroy

    if URI(request.referer).path == "/electedofficials/#{@electedofficial.id}"
      redirect_to("/", :notice => "Electedofficial deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Electedofficial deleted.")
    end
  end
end
