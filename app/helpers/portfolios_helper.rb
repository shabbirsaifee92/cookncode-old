module PortfoliosHelper
  def image_generator(image:, placeholder:)
    if image.attached?
      image_tag url_for image
    else
      image_tag placeholder
    end
  end
end