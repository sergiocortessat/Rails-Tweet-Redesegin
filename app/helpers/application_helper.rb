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
end
