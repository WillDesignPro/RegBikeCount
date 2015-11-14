module StepCountersHelper
  def picture_kind(value)
    if value == 0
      image_tag 'pedestre.png'
    else
      image_tag 'ciclista.png'
    end
  end
end
