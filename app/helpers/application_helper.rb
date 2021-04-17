module ApplicationHelper
    #liked? can be used to differentiate buttons on the view by knowing in wich stage it is
  def liked?(subject, type)
    result = false
    if type == 'post'
      result = Like.where(user_id: current_user.id, post_id:
                          subject.id).exists?
    end
    if type == 'comment'
      result = Like.where(user_id: current_user.id, comment_id:
                          subject.id).exists?
    end
    result
  end
end
