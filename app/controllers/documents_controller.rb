class DocumentsController < ApplicationController

	def new
    if params[:id].present?
      @document = Document.new
      @document.vehicle_id = params[:id]
      @document.file = params[:file]
      raise @document

    end
    if params[:vehicle_id].present?
      @document = Document.new
      @document.vehicle_id = params[:vehicle_id]
      @document.file = params[:file]
      # raise @document
    end
    
  end


  def create
    @document = Document.new(document_params)
    # @document.vehicle_id = params[:vehicle_id]
    if @document.save
      flash[:notice] = "Dokument został dodany."
      redirect_to vehicle_path(:id => @document.vehicle_id)
      #redirect_to controller: 'vehicles', :action => "show", :vehicle_id => :id
      # raise @document
      # redirect_to  vehicle_path(Vehicle.find(@document.vehicle_id), @document.vehicle_id)
    else
      flash[:notice] = "Dokument nie został dodany."
      raise @document
      # redirect_to vehicle_path(vehicle.find(@document.vehicle_path), :documents => 1)
    end

  end

	def index
    @documents = Document.where(:vehicle_id => params[:vehicle_id])
  end

	def show
		@documents = Document.all
	end 

  def destroy
    @document = Document.find(params[:id])
    vehicle_id = params[:vehicle_id]


    respond_to do |format|
      if @document.destroy
        flash[:success] = t("documents.deleted", :name => @document.name) 
        #Menu.where(parent_id: @menu.id).destroy_all
       
      else
        flash[:error] = t("documents.not_deleted", :name => @document.name)
        
      end
      #raise vehicle_id
      format.html { redirect_to vehicle_path(@document.vehicle_id) }
    end

  end
  def download_file
    #@reference = Reference.find(2)
    #@references = reference
    #raise @references.inspect
    documents = Document.find(params[:id])
    send_file("#{Rails.root}/public/#{documents.file}", 
              :disposition => 'attachment')

  end

  def document_params
      params.require(:document).permit(:file, :name, :vehicle_id )
  end

end
