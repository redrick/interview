module ApplicationHelper
  def toggle(url, value, options = {})
    options.deep_merge!({ class: :'btn btn-default', method: :patch, remote: true, data: { disable: true } })
    if value
      yes = content_tag :span, (content_tag :i, nil, class: :'fa fa-check'), class: :'btn btn-success'
      no = link_to (content_tag :i, nil, class: :'fa fa-times'), url, options
    else
      yes = link_to (content_tag :i, nil, class: :'fa fa-check'), url, options
      no = content_tag :span, (content_tag :i, nil, class: :'fa fa-times'), class: :'btn btn-danger'
    end
    content_tag :div, class: :'btn-group btn-group-xs', data: { behaviour: :toggle } do
      "#{yes} #{no}".html_safe
    end
  end
end
