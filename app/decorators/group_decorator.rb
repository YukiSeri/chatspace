module GroupDecorator
  def message_last
    if messages.last.try(:text)
      messages.last.text
    elsif messages.last.try(:image)
      '画像が投稿されています。'
    else
      'まだメッセージはありません'
    end
  end
end
