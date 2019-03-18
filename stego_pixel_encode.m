
clc;
clear all;
text_file = fopen('<textfilepath>', 'rb');    
read_file = fread(text_file, [1, inf], 'char'); 
fclose(text_file);        
read_file=uint16(read_file);    %normally 8bit converted to 16bit for calculation purpose considering file size

image=imread('<imagepath>'); 

image=uint16(image);
[row,col]=size(image);

characters=numel(read_file);   
char_pos=1;

for i=1:row
    for j=1:col
        if(char_pos<=characters)
            
            if(image(i,j)+read_file(char_pos)>255)
                temp=image(i,j)+read_file(char_pos)-256;
            else
                temp=image(i,j)+read_file(char_pos);
            end
            pix_encrypted(i,j)=uint8(temp);
        else
            pix_encrypted(i,j)=uint8(image(i,j));
        end
        char_pos=char_pos+1;
    end
end

imwrite(pix_encrypted,'<stegoimagepath>');  

            