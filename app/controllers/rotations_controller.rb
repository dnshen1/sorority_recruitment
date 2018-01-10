class RotationsController < ApplicationController
  def index
    @q = Rotation.ransack(params[:q])
    @rotations = @q.result(:distinct => true).includes(:bump_group, :party).page(params[:page]).per(10)

    render("rotations/index.html.erb")
  end

  def show
    @rotation = Rotation.find(params[:id])

    render("rotations/show.html.erb")
  end

  def new
    @rotation = Rotation.new

    render("rotations/new.html.erb")
  end

  def create
    @rotation = Rotation.new

    @rotation.bump_group_id = params[:bump_group_id]
    @rotation.party_id = params[:party_id]

    save_status = @rotation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/rotations/new", "/create_rotation"
        redirect_to("/rotations")
      else
        redirect_back(:fallback_location => "/", :notice => "Rotation created successfully.")
      end
    else
      render("rotations/new.html.erb")
    end
  end

  def edit
    @rotation = Rotation.find(params[:id])

    render("rotations/edit.html.erb")
  end

  def update
    @rotation = Rotation.find(params[:id])

    @rotation.bump_group_id = params[:bump_group_id]
    @rotation.party_id = params[:party_id]

    save_status = @rotation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/rotations/#{@rotation.id}/edit", "/update_rotation"
        redirect_to("/rotations/#{@rotation.id}", :notice => "Rotation updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Rotation updated successfully.")
      end
    else
      render("rotations/edit.html.erb")
    end
  end

  def destroy
    @rotation = Rotation.find(params[:id])

    @rotation.destroy

    if URI(request.referer).path == "/rotations/#{@rotation.id}"
      redirect_to("/", :notice => "Rotation deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Rotation deleted.")
    end
  end
end
