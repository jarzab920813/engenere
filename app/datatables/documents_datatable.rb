class DocumentsDatatable
  delegate :params, :current_user, :link_to, :to => :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: documents.count,
      iTotalDisplayRecords: documents.total_entries,
      aaData: data
    }
  end

private

  def data

    documents.map do |document|
      param = []
      param << document.name
      param << "abc"
      param << "ccc"
 
      param
    end
  end

  def document
    @documents ||= fetch_documents
  end

  def fetch_documents

    documents = Document.all.where(:vehicle_id => params[:id]).order("#{sort_column} #{sort_direction}")
    documents = documents.page(page).per_page(per_page)
    if params[:sSearch].present?
      documents = documents.where("
        name like :search 
        
        ", search: "%#{params[:sSearch]}%")
    end
    documents
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name ]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end