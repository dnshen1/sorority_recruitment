class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.page(params[:page]).per(10)

    render("conversations/index.html.erb")
  end

  def show
    @conversation = Conversation.find(params[:id])

    render("conversations/show.html.erb")
  end

  def new
    @conversation = Conversation.new

    render("conversations/new.html.erb")
  end

  def create
    @conversation = Conversation.new

    @conversation.party_id = params[:party_id]
    @conversation.member_id = params[:member_id]
    @conversation.pnm_id = params[:pnm_id]

    save_status = @conversation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/conversations/new", "/create_conversation"
        redirect_to("/conversations")
      else
        redirect_back(:fallback_location => "/", :notice => "Conversation created successfully.")
      end
    else
      render("conversations/new.html.erb")
    end
  end

  def edit
    @conversation = Conversation.find(params[:id])

    render("conversations/edit.html.erb")
  end

  def update
    @conversation = Conversation.find(params[:id])

    @conversation.party_id = params[:party_id]
    @conversation.member_id = params[:member_id]
    @conversation.pnm_id = params[:pnm_id]

    save_status = @conversation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/conversations/#{@conversation.id}/edit", "/update_conversation"
        redirect_to("/conversations/#{@conversation.id}", :notice => "Conversation updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Conversation updated successfully.")
      end
    else
      render("conversations/edit.html.erb")
    end
  end

  def destroy
    @conversation = Conversation.find(params[:id])

    @conversation.destroy

    if URI(request.referer).path == "/conversations/#{@conversation.id}"
      redirect_to("/", :notice => "Conversation deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Conversation deleted.")
    end
  end
end
