module.exports = (robot) ->
 robot.respond /help$/i, (msg) ->
    message = "charlie 生存確認\n"
    message += "pain 痛い話をします\n"
    msg.send message 

  robot.respond /charlie$/i, (msg) ->
    msg.send "斉藤サイクル"

  robot.respond /pain/i, (msg) ->
    pain = ['階段から落ちて手首を切る', 
　　　　　　'おしりにマイナスドライバーがささる', 
　　　　　　'左足人差し指の爪が剥がれる', 
　　　　　　'気づいたら右手の中指が折れてました']
    pain = msg.random pains
    msg.reply pain
