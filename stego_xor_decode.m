encrypted_image=imread('<stegoimagepath>');
original_image=imread('<imagepath>');

encrypted_image=uint16(encrypted_image);
original_image=uint16(original_image);
[x_row,x_col]=size(encrypted_image);
done=0;
char_pos=1;
for i=1:x_row
    for j=1:x_col
          t=bitxor(encrypted_image(i,j),original_image(i,j));
          if(t~=0)
            text(char_pos)=uint8(t);
            char_pos=char_pos+1;
          else
            done=1;
            break;
        end
    end
    if(done==1)
        break;
    end
end


file=fopen('<textfilepath>','w');  
for i=1:char_pos-1
    fprintf(file,'%c',text(i)); 
end