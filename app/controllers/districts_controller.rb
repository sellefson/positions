class DistrictsController < ApplicationController
  def index
    @districts = District.all

    render("districts/index.html.erb")
  end

  def show
    @district = District.find(params[:id])

    render("districts/show.html.erb")
  end

  def new
    @district = District.new

    render("districts/new.html.erb")
  end

  def create
    @district = District.new

    @district.name = params[:name]

    save_status = @district.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/districts/new", "/create_district"
        redirect_to("/districts")
      else
        redirect_back(:fallback_location => "/", :notice => "District created successfully.")
      end
    else
      render("districts/new.html.erb")
    end
  end

  def edit
    @district = District.find(params[:id])

    render("districts/edit.html.erb")
  end

  def update
    @district = District.find(params[:id])

    @district.name = params[:name]

    save_status = @district.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/districts/#{@district.id}/edit", "/update_district"
        redirect_to("/districts/#{@district.id}", :notice => "District updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "District updated successfully.")
      end
    else
      render("districts/edit.html.erb")
    end
  end

  def destroy
    @district = District.find(params[:id])

    @district.destroy

    if URI(request.referer).path == "/districts/#{@district.id}"
      redirect_to("/", :notice => "District deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "District deleted.")
    end
  end
end
