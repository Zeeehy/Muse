package com.muse.common;

import java.security.MessageDigest;

//ȸ�������� �� ��й�ȣ ��ȣȭ������ ���
public class Sha256{
    public static String encrypt(String plainText) {
        try{
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(plainText.getBytes());
            byte byteData[] = md.digest();
    

            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
 

            StringBuffer hexString = new StringBuffer();
            for (int i=0;i<byteData.length;i++) {
                String hex=Integer.toHexString(0xff & byteData[i]);
                if(hex.length()==1){
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            return hexString.toString();
        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException();
        }
    }
}


//��ȣȭ
/*
private String encryptSHA256(String data) {
  try {
      MessageDigest digest = MessageDigest.getInstance("SHA-256");
      byte[] encodedHash = digest.digest(data.getBytes(StandardCharsets.UTF_8));
      StringBuilder hexString = new StringBuilder();
      for (byte b : encodedHash) {
          String hex = Integer.toHexString(0xff & b);
          if (hex.length() == 1) {
              hexString.append('0');
          }
          hexString.append(hex);
      }
      return hexString.toString();
  } catch (NoSuchAlgorithmException e) {
      e.printStackTrace();
      return null;
  }
}

//��й�ȣ ��ȣȭ
@Override
public void encryptPassword(MemberVO memberVO) {
  String password = memberVO.getPwd();
  // ��й�ȣ ��ȣȭ
  String encryptedPassword = encryptSHA256(password);
  memberVO.setPwd(encryptedPassword);
}
*/