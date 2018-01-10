class PnmsController < ApplicationController
  def index
    @q = Pnm.ransack(params[:q])
    @pnms = @q.result(:distinct => true).includes(:party, :conversations, :members).page(params[:page]).per(10)

    render("pnms/index.html.erb")
  end

  def show
    @conversation = Conversation.new
    @pnm = Pnm.find(params[:id])

    render("pnms/show.html.erb")
  end

  def new
    @pnm = Pnm.new

    render("pnms/new.html.erb")
  end

  def create
    @pnm = Pnm.new

    @pnm.name = params[:name]
    @pnm.hometown = params[:hometown]
    @pnm.year = params[:year]
    @pnm.party_id = params[:party_id]

    save_status = @pnm.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/pnms/new", "/create_pnm"
        redirect_to("/pnms")
      else
        redirect_back(:fallback_location => "/", :notice => "Pnm created successfully.")
      end
    else
      render("pnms/new.html.erb")
    end
  end

  def edit
    @pnm = Pnm.find(params[:id])

    render("pnms/edit.html.erb")
  end

  def update
    @pnm = Pnm.find(params[:id])

    @pnm.name = params[:name]
    @pnm.hometown = params[:hometown]
    @pnm.year = params[:year]
    @pnm.party_id = params[:party_id]

    save_status = @pnm.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/pnms/#{@pnm.id}/edit", "/update_pnm"
        redirect_to("/pnms/#{@pnm.id}", :notice => "Pnm updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Pnm updated successfully.")
      end
    else
      render("pnms/edit.html.erb")
    end
  end

  def destroy
    @pnm = Pnm.find(params[:id])

    @pnm.destroy

    if URI(request.referer).path == "/pnms/#{@pnm.id}"
      redirect_to("/", :notice => "Pnm deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Pnm deleted.")
    end
  end
end
