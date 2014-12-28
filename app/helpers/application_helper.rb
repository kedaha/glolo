module ApplicationHelper
  # bless you Railscasts: http://railscasts.com/episodes/409-active-model-serializers?view=asciicast
  def json_for(target, options = {})
    options[:scope] ||= self
    options[:url_options] ||= url_options
    target.active_model_serializer.new(target, options).to_json.html_safe
  end
end
