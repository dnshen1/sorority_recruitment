class BumpGroupsController < ApplicationController
  def index
    @bump_groups = BumpGroup.all

    render("bump_groups/index.html.erb")
  end

  def show
    @rotation = Rotation.new
    @member = Member.new
    @bump_group = BumpGroup.find(params[:id])

    render("bump_groups/show.html.erb")
  end

  def new
    @bump_group = BumpGroup.new

    render("bump_groups/new.html.erb")
  end

  def create
    @bump_group = BumpGroup.new

    @bump_group.letter = params[:letter]

    save_status = @bump_group.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bump_groups/new", "/create_bump_group"
        redirect_to("/bump_groups")
      else
        redirect_back(:fallback_location => "/", :notice => "Bump group created successfully.")
      end
    else
      render("bump_groups/new.html.erb")
    end
  end

  def edit
    @bump_group = BumpGroup.find(params[:id])

    render("bump_groups/edit.html.erb")
  end

  def update
    @bump_group = BumpGroup.find(params[:id])

    @bump_group.letter = params[:letter]

    save_status = @bump_group.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bump_groups/#{@bump_group.id}/edit", "/update_bump_group"
        redirect_to("/bump_groups/#{@bump_group.id}", :notice => "Bump group updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bump group updated successfully.")
      end
    else
      render("bump_groups/edit.html.erb")
    end
  end

  def destroy
    @bump_group = BumpGroup.find(params[:id])

    @bump_group.destroy

    if URI(request.referer).path == "/bump_groups/#{@bump_group.id}"
      redirect_to("/", :notice => "Bump group deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bump group deleted.")
    end
  end
end
