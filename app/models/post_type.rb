class PostType
  POST_TYPES = [PostItemSale, PostJob]

  def self.all
    @all ||= all_enums.map{|enum| {type: enum, presentation: I18n.t("post_types.#{enum}")} }
  end

  def self.from_enum(enum)
    enum.camelize.constantize if all_enums.include?(enum)
  end

  private

  def self.all_enums
    @all_enums ||= POST_TYPES.map{ |klass| klass.to_s.underscore }
  end
end
