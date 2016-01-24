class EventsDatatable
  delegate :params, :current_user, :content_tag, :link_to, :t, :edit_event_path, :to => :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: eventy.count,
      iTotalDisplayRecords: eventy.total_entries,
      aaData: data
    }
  end

private

  def data

    eventy.map do |event|
      param = []
      param << event.name
      param << event.date_event_start
      param << event.date_next_event
      param << event.current_mileage
      param << event.mileage_to_next_event
      param << type_of_event(event)
      param << actions(event)
      param
    end
  end

  def eventy
    @events ||= fetch_events
  end

  def fetch_events

    eventy = Event.where(:vehicle_id => params[:id]).order("#{sort_column} #{sort_direction}")
    eventy = eventy.page(page).per_page(per_page)
    if params[:sSearch].present?
      eventy = eventy.where("
        name like :search or
        date_event_start like :search or
        date_next_event like :search or 
        current_mileage like :search 
        ", search: "%#{params[:sSearch]}%")
    end
    eventy 
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name date_event_start date_next_event current_mileage mileage_to_next_event types_of_events ]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

  def actions(event)
    html = link_to(event) do
      content_tag :i, '', :class => "fa fa-eye", :data => { :toggle => "tooltip", :placement => "top"}, :title => "Pokaż szczegóły"
    end

    html << link_to(edit_event_path(event)) do 
      content_tag :i, '', :class => "fa fa-pencil-square-o", :data => { :toggle => "tooltip", :placement => "top"}, :title => "Edytuj"
    end

    html << link_to(event, :method => :delete, :data => { :confirm => t("event.confirm_delete"), :name => event.name }) do
      content_tag :i, '', :class => "fa fa-trash", :data => { :toggle => "tooltip", :placement => "top"}, :title => "Usuń"
    end

    content_tag :div, :class => "table_actions text-center" do
      html
    end
  end

  def type_of_event(event)
    TypesOfEvent.where(:id => event.type_of_event_id).first.name.to_s
  end


end