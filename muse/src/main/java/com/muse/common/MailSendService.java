package com.muse.common;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


@Service
public class MailSendService {
	@Autowired 
	private JavaMailSenderImpl mailSender;
	private String authNumber;

   // 난수 발생  
   public void generateVerificationCode() {
      
      String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        int length = 6;

        Random random = new Random();
        StringBuilder code = new StringBuilder();

        
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            code.append(characters.charAt(index));
        }
        System.out.println("인증번호 : " + code);
        authNumber = code.toString();
   }
   
   
   //아이디찾기 이메일 보낼 양식! 
      public String joinIdEmail(String email) {
         generateVerificationCode();
         String setFrom = "musepeplead2024@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
         String toMail = email;
         String title = "[MUSE] 아이디찾기 인증번호 이메일 입니다."; // 이메일 제목 
         String content = 
               
               "<table width='650' border='0' cellspacing='0' cellpadding='0' bgcolor='#f6f5fa' style='font-family:'NanumSquareR', 'NanumSquare', 'Noto Sans KR', 'Apple SD Gothic Neo', '나눔고딕', NanumGothic, '맑은 고딕', 'Malgun Gothic', '돋움', dotum, sans-serif;'>"+
                     "<tbody>"+
                        "<tr><td style='padding:24px 24px 0 24px;'>"+
                           "<table width='100%' border='0' cellspacing='0' cellpadding='0' bgcolor='#fff'>"+
                              "<tbody><tr><td valign='top' style='padding:40px 0 0 20px; font-size:0;'><img src='http://127.0.0.1:9090/flowerhouse/resources/img/main_FH.PNG' alt='FLOWER HOUSE' loading='lazy'></td></tr>"+
                              "</tbody>"+
                           "</table></td></tr>"+
                        "<tr><td style='padding: 0 24px;'>"+
                           "<table width='100%' border='0' cellspacing='0' cellpadding='0' bgcolor='#fff' style='padding:0px 20px 50px;'>"+
                              "<tbody><tr><td style='padding-top: 39px; font-size: 26px; font-family: NanumSquare, sans-serif; font-weight: 700; line-height: 26px;'>아이디찾기 인증번호</td></tr>"+
                              "<tr><td style='padding: 19px 0px 50px; font-family: NanumSquare, sans-serif; font-size: 17px; color: #999; '>아이디찾기 화면에서 아래 인증번호를 입력 해 주세요.</td></tr>"+
                              "<tr><td height='1' bgcolor='#000'></td></tr>"+
                              "<tr><td height='65'>"+
                                 "<table width='100%' height='65' border='0' cellspacing='0' cellpadding='0' bgcolor='#fff'>"+
                                    "<tbody><tr><td width='148' style='font-family: NanumSquare, sans-serif; font-size: 16px;text-align: center; line-height: 65px;'>인증번호</td>"+
                                       "<td width='1' height='23' style='opacity: 0.2;'>"+
                                          "<table width='100%' border='0' cellspacing='0' cellpadding='0' bgcolor='#fff'>"+
                                             "<tbody><tr><td height='3' bgcolor='#fff'></td></tr>"+
                                                "<tr><td height='17' bgcolor='#000'></td></tr>"+
                                                "<tr><td height='3' bgcolor='#fff'></td></tr>"+
                                             "</tbody>"+
                                          "</table>"+
                                       "</td>"+
                                       "<td style='padding-left:57px; font-family: NanumSquare, sans-serif; font-size: 16px; line-height: 65px;'>" + authNumber + "</td>"+
                                    "</tr></tbody>"+
                                 "</table>"+
                              "</td></tr>"+
                              "<tr><td height='1' bgcolor='#000'></td></tr>"+
                           "</tbody></table>"+
                        "</td></tr>"+
                        "<tr><td style='padding: 24px 24px 48px 24px;'>"+
                           "<table width='100%' border='0' cellspacing='0' cellpadding='0'>"+
                           "</table>"+
                        "</td></tr>"+
               "</tbody></table>";
               
               
         mailSend(setFrom, toMail, title, content);
         return authNumber;
      }
      
      //비밀번호 재설정 이메일 보낼 양식! 
      public void changePwdEmail(String id, String email) {
         generateVerificationCode();
         String setFrom = "musepeplead2024@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
         String toMail = email;
         String title = "[MUSE] 비밀번호 재설정"; // 이메일 제목 
         String content = 
               
               
               
               "<div>" + 
               "   <table width='650' border='0' cellspacing='0' cellpadding='0' bgcolor='#f6f5fa' style='font-family:'NanumSquareR', 'NanumSquare', 'Noto Sans KR', 'Apple SD Gothic Neo', '나눔고딕', NanumGothic, '맑은 고딕', 'Malgun Gothic', '돋움', dotum, sans-serif;'>" + 
               "      <tbody><tr><td style='padding:24px 24px 0 24px;'>" + 
               "          <table width='100%' border='0' cellspacing='0' cellpadding='0' bgcolor='#fff'>" + 
               "                        <tbody><tr><td valign='top' style='padding:40px 0 0 20px; font-size:0;'><img src='http://127.0.0.1:9090/flowerhouse/resources/img/main_FH.PNG' alt='FLOWER HOUSE' loading='lazy'></td></tr>" + 
               "                    </tbody></table>" + 
               "                </td></tr>" + 
               "            <tr><td style='padding: 0 24px;'>" + 
               "                    <table width='100%' border='0' cellspacing='0' cellpadding='0' bgcolor='#fff' style='padding:0px 20px 50px;'>" + 
               "                        <tbody><tr><td style='padding-top: 39px; font-size: 26px; font-family: NanumSquare, sans-serif; font-weight: 700; line-height: 26px;'>비밀번호 재설정 안내</td></tr>" + 
               "                        <tr><td height='74' style='padding: 19px 0px 50px; font-family: NanumSquare, sans-serif; font-size: 17px; color: #999; line-height: 26px;'>" + 
               "아래의 계정에 대한 비밀번호 재설정 요청으로 <br>" + 
               "해당 이메일이 발송되었습니다.<br>" + 
               "하단의 비밀번호 재설정을 클릭하여, 새 비밀번호를 설정하세요." + 
               "                            </td></tr>" + 
               "                        <tr><td height='1' bgcolor='#000'></td></tr>" + 
               "                        <tr><td height='65'>" + 
               "                                <table width=\"100%\" height=\"65\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">" + 
               "                                    <tbody><tr><td width=\"148\" style=\"font-family: NanumSquare, sans-serif; font-size: 16px; text-align: center;  line-height: 65px;\">아이디</td><td width=\"1\" height=\"23\" style=\"opacity: 0.2;\">" + 
               "                                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\">" + 
               "                                                <tbody><tr><td height=\"3\" bgcolor=\"#fff\"></td></tr>" + 
               "                                                <tr><td height=\"17\" bgcolor=\"#000\"></td></tr>" + 
               "                                                <tr><td height=\"3\" bgcolor=\"#fff\"></td></tr>" + 
               "                                            </tbody></table>" + 
               "                                        </td><td style='font-family: NanumSquare, sans-serif; padding-left:57px; font-size: 16px;  line-height: 65px;'>" + id + "</td></tr>" + 
               "                                </tbody></table>" + 
               "                            </td></tr>" + 
               "                        <tr><td height=\"1\" bgcolor=\"#000\"></td></tr>" + 
               "                        <tr><td height=\"39\"></td></tr>" + 
               "                        <tr><td align='center' height='56'><form method='post' action=>" + 
               "                    <input type='hidden' name='id' value='" + id + "'/>" + 
               "                    <button type='submit' style='display: inline-block; padding: 18px 90px; border-radius: 28px; background: #bc8dd1; color: #fff; font-size: 18px; line-height: 20px; font-family: nanumsquare, sans-serif; letter-spacing: -0.45px; text-decoration: none; border: none; cursor: pointer;'>비밀번호 재설정</button></form></td></tr>" + 
               "                    </tbody></table>" +                                  
               "                </td></tr>" + 
               "            <tr><td style=\"padding: 24px 24px 48px 24px;\">" + 
               "                    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" + 
               "                        <tbody><tr><td style='padding: 22px 60px 0 20px; font-size:0;'><img src='http://127.0.0.1:9090/flowerhouse/resources/img/main_FH.PNG' alt='FLOWER HOUSE' loading='lazy'></td><td style='font-size: 13px;'>" + 
               "                                <p style=\"margin:0; font-size: 12px; letter-spacing:1.2px; color: #8e59e6; \">COMPANY.</p>" + 
               "                                <address style=\"padding-top: 22px; font-family: NanumSquare, sans-serif; font-style: normal;\">서울특별시 서초구 강남대로 351, 12층(서초동) (주)FLOWER HOUSE</address>" + 
               "                                <p style=\"margin:0; padding-top: 5px; font-family: NanumSquare, sans-serif;\">사업자등록번호 111-11-11111</p>" + 
               "                                <p style=\"margin:0; padding-top: 5px; font-family: NanumSquare, sans-serif;\">COPYRIGHT © FLOWERHOUSE, co. ALL RIGHTS RESERVED</p>" + 
               "                            </td></tr>" + 
               "                    </tbody></table>" + 
               "                </td></tr>" + 
               "        </tbody></table>" + 
               "    <table style='display:none'><tbody><tr><td><img src='https://email-track.ncloud.com/received/v2/MjAyMzA2MTQwMDAwMTAzNTM5MDI7MTc0Njs7aW9wbmcxMjNAbmF2ZXIuY29t.gif' width='0' height='0' border='0' loading='lazy'></td></tr></tbody></table>" + 
               "</div>";
               
               
         mailSend(setFrom, toMail, title, content);

      }
      
   
   //이메일 전송 메소드
   public void mailSend(String setFrom, String toMail, String title, String content) { 
	   System.out.println(0);
	   
	   System.out.println("setFrom: " + setFrom);
	   System.out.println("toMail: " + toMail);
	   System.out.println("title: " + title);
	   System.out.println("content: " + content);

	    if (setFrom == null || toMail == null || title == null || content == null) {
	        System.out.println("One or more parameters are null");
	        return;
	    }
	    
	  System.out.println(mailSender);
	  
      MimeMessage message = mailSender.createMimeMessage();
      // true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
      System.out.println(1);
      try {
         MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
         helper.setFrom(setFrom);
         helper.setTo(toMail);
         helper.setSubject(title);
         // true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
         helper.setText(content,true);
         System.out.println(2);
         mailSender.send(message);
      } catch (MessagingException e) {
         e.printStackTrace();
      }
   }
}
