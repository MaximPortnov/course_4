   M S B A M L   `   `   `  ����F  BAutoservice, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:AutoserviceAutoservice  5   	       Autoservice.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:Autoservice     5   	     � Title$  
MainWindow��5   	   $	��450��6   $	��800��6)    � 	Resources 5	      '   !Autoservice.TagsToStringConverter   TagsToStringConverter��%   &	          5
   
   6&   5      .��5      � .+�5   
   �� -   5         ��Name$ SearchTextBox��5      $	��300��6)   $
��Left=�65   $��	10,10,0,0q�6P   $	��Top=�6c   6{   �� 5   
   -   5         ��Name$ GenderFilter��5      $	��120��6)   $
��Left=�65   $��
320,10,0,0q�6P   $	��Top=�6d   .@�5      �� $	��All��6   �� 5      $
��Male��6   �� 5      $��Female��6   5      �� 5   
   -   5        $ SortByComboBox��5      $	��120��6+   $
��Left=�67   $��
450,10,0,0q�6R   $	��Top=�6f   .@�5      �� $��Surname��6   �� 5      $��
Last Visit��6   �� 5      $��Visits Count��6   5      �� 5   
   -   5         ��Name$ BirthdayThisMonthCheckBox��5      $��Birthday This Month��66   $��
580,10,0,0q�6T   $	��Top=�6h   6�   �� 5"   
   -   5        $��Add/Edit Client��5"      $	��120��6+   $��30��67   $
��Left=�6C   $��	10,40,0,0q�6^   $	��Top=�6q   6�   �� 5%   
   -   5        $��Delete Client��5%      $	��120��6)   $��30��65   $
��Left=�6A   $��
140,40,0,0q�6\   $	��Top=�6p   6�   �� 5(   
   -   5        $��View Client Visits��5(      $	��120��6.   $��30��6:   $
��Left=�6F   $��
270,40,0,0q�6a   $	��Top=�6u   6�   &   System.Windows.Controls.DataGrid  5+   
   -   5          Name$ ClientsDataGrid��5+         AutoGenerateColumns .  $��10,80,10,50q�6H      
IsReadOnly .    SelectionMode$ Single=�6o   	   Columns	 5,      0  *System.Windows.Controls.DataGridTextColumn  5-      ,  &System.Windows.Controls.DataGridColumn
   Header$
 ID��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ 50 6H   1  +System.Windows.Controls.DataGridBoundColumn   Binding 61   �� *Id+6H     5.      $
 Gender��6%   $ 50 6T    65   �� *
GenderCode+6T     5/      $

 Name��6%   $	 100 6Q    63   �� *	FirstName+6Q     50      $
 Surname��6%   $	 100 6S    66   �� *
LastName+6S     51      $
 
Patronymic��6%   $	 100 6X    69   �� *
Patronymic+6X     52      $
 Date of Birth��6%   $	 100 6Z    6<   �� *	BirthDate+6Z     53      $
 Phone��6%   $	 100 6N    64   �� *Phone+6N     54      $
 Email��6%   $	 150 6N    64   �� *Email+6N     55      $
 
Date Added��6%   $	 100 6^    69   �� *RegistrationDate+6^     56      $
 
Last visit��6%    69   �� *LastVisitDate+ �� TargetNullValue$  �� �� StringFormat$ {0:MM/dd/yyyy}��  57      $
 Visits Count��6%   $	 100 6Z    6;   �� *
VisitCount+6Z   4  .System.Windows.Controls.DataGridTemplateColumn  58      $

 Tags��6)   $	 150 67      CellTemplate 59      �� 5:      .R�5;      �� ��6+   �� *Tags+��5<   "   �� 5=   &   .R�5>   *   �� 
�������$��2q�5A   $    �� Padding$ 5q�5B   $    J� Opacity$ 1Q�5C   $   $
��Bold"�5D   $   ��5>   4   �� *Title+��5?   $   �� *Color+5D   $   5E   '   5G      5H      5J      5M      �� 5P   
    �� Orientation$ 
Horizontal=�6   $
��Left=�6.   $��Bottom=�6I   $��	10,0,0,10q�6d   .+�5Q      �� -	   5        $��Previous Page��5Q      $	��100��6-   69   �� 5R      -
   5        $��	Next Page��5R      $	��100��6)   $��10,0,0,0q�65   6G   �� 5S      -   5         ��Name$ PageInfoTextBlock��5S      $��20,0,0,0q�63   5T      �� 5W   
   -   5        $ RecordsPerPageComboBox��5W      $	��100��63   $��Bottom=�6?   $��Right=�6Z   $��	0,0,10,10q�6v   .@�5X      �� $��10��6   �� 5Y      $��50��6   �� 5Z      $	��200��6   �� 5[      $	��All��6   5\      �� 5_   
   -   5        $ RecordCountTextBlock��5_      $��Right=�62   $��Bottom=�6N   $��
0,0,120,10q�6i   5`      5a      