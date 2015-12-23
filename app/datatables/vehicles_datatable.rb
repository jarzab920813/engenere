class VehiclesDatatable
  delegate :params, :current_user, :link_to, :to => :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: current_user.vehicles.count,
      iTotalDisplayRecords: vehicles.total_entries,
      aaData: data
    }
  end

private

  def data
    vehicles.map do |vehicle|
      param = []
      param << link_to(vehicle.name, vehicle)
      param << vehicle.brand
      param << vehicle.model
      param << vehicle.registration_number
      param
    end
  end

  def vehicles
    @vehicles ||= fetch_vehicles
  end

  def fetch_vehicles
    vehicles = current_user.vehicles.order("#{sort_column} #{sort_direction}")
    vehicles = vehicles.page(page).per_page(per_page)
    if params[:sSearch].present?
      vehicles = vehicles.where("
        name like :search or
        brand like :search or
        model like :search
        ", search: "%#{params[:sSearch]}%")
    end
    vehicles
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name brand model registration_number]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end