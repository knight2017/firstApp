class QuestionDecorator < Draper::Decorator
  delegate_all
  def title
    object.title.titleize
  end
  def user_name
    object.aauser.full_name if object.aauser
  end
  def tag_display
    object.tag.map{|t| t.title.capitalize}.join(" ")
  end

  def thumbs_up_button
    h.link_to h.fa_icon("thumbs-up"), h.question_like_path(object, object.like_for(h.current_user)), method: :delete, class: "like-icon"
  end
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
