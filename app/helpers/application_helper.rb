module ApplicationHelper
  # liked? can be used to differentiate buttons on the view by knowing in wich stage it is
  def liked?(subject, type)
    result = false
    if type == 'opinion'
      result = Like.where(user_id: current_user.id, opinion_id:
                          subject.id).exists?
    end
    if type == 'comment'
      result = Like.where(user_id: current_user.id, comment_id:
                          subject.id).exists?
    end
    result
  end

  def notice?
    return unless notice.present?

    content_tag(:div, class: 'notice notifications') do
      content_tag(:p, notice)
    end
  end

  def alert?
    return unless alert.present?

    content_tag(:div, class: 'notice notifications') do
      content_tag(:p, alert)
    end
  end

  def dynamic_like(subject, type)
    link_to opinion_likes_path(subject), class: 'text-light card-link', method: :post, id: 'like' do
      if liked?(subject, type)
        content_tag :button, class: 'btn btn-neutral' do
          content_tag :span, class: 'text-dark mt-2 mb-2' do
            content_tag :strong do
              'Unlike'
            end
          end
        end
      else
        content_tag :button, class: 'btn btn-neutral' do
          content_tag :span, class: 'text-dark mt-2 mb-2' do
            content_tag :strong do
              'Like'
            end
          end
        end
      end
    end
  end
end
