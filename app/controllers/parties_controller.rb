class PartiesController < ApplicationController
  def index
    @parties = Party.all

    render("parties/index.html.erb")
  end

  def show
    @party = Party.find(params[:id])

    render("parties/show.html.erb")
  end

  def new
    @party = Party.new

    render("parties/new.html.erb")
  end

  def create
    @party = Party.new


    save_status = @party.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/parties/new", "/create_party"
        redirect_to("/parties")
      else
        redirect_back(:fallback_location => "/", :notice => "Party created successfully.")
      end
    else
      render("parties/new.html.erb")
    end
  end

  def edit
    @party = Party.find(params[:id])

    render("parties/edit.html.erb")
  end

  def update
    @party = Party.find(params[:id])


    save_status = @party.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/parties/#{@party.id}/edit", "/update_party"
        redirect_to("/parties/#{@party.id}", :notice => "Party updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Party updated successfully.")
      end
    else
      render("parties/edit.html.erb")
    end
  end

  def destroy
    @party = Party.find(params[:id])

    @party.destroy

    if URI(request.referer).path == "/parties/#{@party.id}"
      redirect_to("/", :notice => "Party deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Party deleted.")
    end
  end
end
