class PictureMailer < ApplicationMailer
  def picture_mail(contact)
    @contact = content

    mail to: "t757f37a@gmail.com", subject: "お問い合わせ確認のメール"
  end
end
