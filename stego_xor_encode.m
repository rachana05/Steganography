clc;
clear all;
text_file = fopen('<textfilepath>', 'rb');    
read_file = fread(text_file, [1, inf], 'char'); 
fclose(text_file);        
read_file=uint16(read_file);
image=imread('<imagepath>'); 
pixel=uint16(image);
[row,col]=size(pixel);
character_count=numel(read_file);
char_pos=1;
for i=1:row
    for j=1:col
        if(char_pos<=character_count)
            encrypted_pixel=bitxor(pixel(i,j),read_file(char_pos));
            pix_encrypted(i,j)=uint8( encrypted_pixel);
        else
            pix_encrypted(i,j)=uint8(pixel(i,j));
        end
        char_pos=char_pos+1;
    end
end
imwrite(pix_encrypted,'<stegoimagepath>'); 
            
            
        
        
    
      