FasdUAS 1.101.10   ��   ��    k             l     ��  ��    l f http://superuser.com/questions/718600/keyboard-shortcut-to-maximize-current-window-application-in-osx     � 	 	 �   h t t p : / / s u p e r u s e r . c o m / q u e s t i o n s / 7 1 8 6 0 0 / k e y b o a r d - s h o r t c u t - t o - m a x i m i z e - c u r r e n t - w i n d o w - a p p l i c a t i o n - i n - o s x   
  
 l      ��  ��    
  Toggles fullscreen status of the active window of the active application.
  Return value indicates if the window is in fullscreen mode *after* toggling.
  Fails silently in case of error, e.g., if the active application doesn't support fullscreen mode, and returns false.
     �  (   
     T o g g l e s   f u l l s c r e e n   s t a t u s   o f   t h e   a c t i v e   w i n d o w   o f   t h e   a c t i v e   a p p l i c a t i o n . 
     R e t u r n   v a l u e   i n d i c a t e s   i f   t h e   w i n d o w   i s   i n   f u l l s c r e e n   m o d e   * a f t e r *   t o g g l i n g . 
     F a i l s   s i l e n t l y   i n   c a s e   o f   e r r o r ,   e . g . ,   i f   t h e   a c t i v e   a p p l i c a t i o n   d o e s n ' t   s u p p o r t   f u l l s c r e e n   m o d e ,   a n d   r e t u r n s   f a l s e . 
      i         I      �������� $0 togglefullscreen toggleFullScreen��  ��    k     C       r         m     ��
�� boovfals  o      ���� &0 isfullscreenafter isFullScreenAfter      O    @    Q    ?  ��  O    6    k    5      ! " ! r    ' # $ # e    % % % n    % & ' & 1   " $��
�� 
valL ' 4    "�� (
�� 
attr ( m     ! ) ) � * *  A X F u l l S c r e e n $ o      ���� 0 isfullscreen isFullScreen "  + , + r   ( , - . - H   ( * / / o   ( )���� 0 isfullscreen isFullScreen . o      ���� &0 isfullscreenafter isFullScreenAfter ,  0�� 0 r   - 5 1 2 1 o   - .���� &0 isfullscreenafter isFullScreenAfter 2 n       3 4 3 1   2 4��
�� 
valL 4 4   . 2�� 5
�� 
attr 5 m   0 1 6 6 � 7 7  A X F u l l S c r e e n��    n     8 9 8 4   �� :
�� 
cwin : m    ����  9 l    ;���� ; 6    < = < 4   �� >
�� 
prcs > m    ����  = =    ? @ ? 1    ��
�� 
pisf @ m    ��
�� boovtrue��  ��    R      ������
�� .ascrerr ****      � ****��  ��  ��    m     A A�                                                                                  sevs  alis    �  Macintosh HD               �)H+  �yNSystem Events.app                                              ��C���M        ����  	                CoreServices    �(��      ���    �yN�yM�yL  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��     B�� B L   A C C C o   A B���� &0 isfullscreenafter isFullScreenAfter��     D E D l     ��������  ��  ��   E  F G F l      �� H I��   H � � 
  Indicates if the active window of the active application is currently in fullscreen mode.
  Fails silently in case of error and returns false.
    I � J J&   
     I n d i c a t e s   i f   t h e   a c t i v e   w i n d o w   o f   t h e   a c t i v e   a p p l i c a t i o n   i s   c u r r e n t l y   i n   f u l l s c r e e n   m o d e . 
     F a i l s   s i l e n t l y   i n   c a s e   o f   e r r o r   a n d   r e t u r n s   f a l s e . 
 G  K L K i     M N M I      �������� 0 isfullscreen isFullScreen��  ��   N k     0 O O  P Q P O     - R S R Q    , T U�� T O    # V W V L    " X X e    ! Y Y n    ! Z [ Z 1     ��
�� 
valL [ 4    �� \
�� 
attr \ m     ] ] � ^ ^  A X F u l l S c r e e n W n     _ ` _ 4   �� a
�� 
cwin a m    ����  ` l    b���� b 6    c d c 4   �� e
�� 
prcs e m   	 
����  d =    f g f 1    ��
�� 
pisf g m    ��
�� boovtrue��  ��   U R      ������
�� .ascrerr ****      � ****��  ��  ��   S m      h h�                                                                                  sevs  alis    �  Macintosh HD               �)H+  �yNSystem Events.app                                              ��C���M        ����  	                CoreServices    �(��      ���    �yN�yM�yL  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   Q  i�� i L   . 0 j j m   . /��
�� boovfals��   L  k l k l     ��������  ��  ��   l  m n m l     o���� o I     �������� $0 togglefullscreen toggleFullScreen��  ��  ��  ��   n  p�� p l     ��������  ��  ��  ��       �� q r s t��   q �������� $0 togglefullscreen toggleFullScreen�� 0 isfullscreen isFullScreen
�� .aevtoappnull  �   � **** r �� ���� u v���� $0 togglefullscreen toggleFullScreen��  ��   u ������ &0 isfullscreenafter isFullScreenAfter�� 0 isfullscreen isFullScreen v  A�� w������ )�� 6����
�� 
prcs w  
�� 
pisf
�� 
cwin
�� 
attr
�� 
valL��  ��  �� DfE�O� 9 0*�k/�[�,\Ze81�k/ *��/�,EE�O�E�O�*��/�,FUW X 	 
hUO� s �� N���� x y���� 0 isfullscreen isFullScreen��  ��   x   y 
 h�� w������ ]������
�� 
prcs
�� 
pisf
�� 
cwin
�� 
attr
�� 
valL��  ��  �� 1� * !*�k/�[�,\Ze81�k/ 
*��/�,EUW X  	hUOf t �� z���� { |��
�� .aevtoappnull  �   � **** z k      } }  m����  ��  ��   {   | ���� $0 togglefullscreen toggleFullScreen�� *j+   ascr  ��ޭ