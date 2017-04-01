function publish_to_html(motorbikes,airplanes,cars,faces,vocabulary_size,descriptor_type)
fileID = fopen('Caltech4/ImageSets/test.txt','r');
fileID2 = fopen(strcat('html/html_result_',descriptor_type,int2str(vocabulary_size),'.html'),'w');
A = textscan(fileID,'%s');
A = A{1};
s=1;
%% the redneck html processing thanks to trump 
stuff = '<!DOCTYPE html>';
fprintf(fileID2,'%s \n',stuff);
stuff = '<html lang="en">';
fprintf(fileID2,'%s \n',stuff);
stuff = '  <head>';
fprintf(fileID2,'%s \n',stuff);
stuff = '    <meta charset="utf-8">';
fprintf(fileID2,'%s \n',stuff);
stuff = '    <title>Image list prediction</title>';
fprintf(fileID2,'%s \n',stuff);
stuff = '  <style type="text/css">';
fprintf(fileID2,'%s \n',stuff);
stuff = '   img {';
fprintf(fileID2,'%s \n',stuff);
stuff = '     width:200px;';
fprintf(fileID2,'%s \n',stuff);
stuff = '   }';
fprintf(fileID2,'%s \n',stuff);
stuff = '  </style>';
fprintf(fileID2,'%s \n',stuff);
stuff = '  </head>';
fprintf(fileID2,'%s \n',stuff);
stuff = '  <body>';
fprintf(fileID2,'%s \n',stuff);
stuff = '';
fprintf(fileID2,'%s \n',stuff);
stuff = '<h2>Arash, Annelore</h2>';
fprintf(fileID2,'%s \n',stuff);
stuff = '<h1>Settings</h1>';
fprintf(fileID2,'%s \n',stuff);
stuff = '<table>';
fprintf(fileID2,'%s \n',stuff);
stuff = '<tr><th>SIFT step size</th><td>5 px</td></tr>';
fprintf(fileID2,'%s \n',stuff);
stuff = '<tr><th>SIFT block sizes</th><td>5 pixels</td></tr>';
fprintf(fileID2,'%s \n',stuff);
stuff = strcat('<tr><th>SIFT method</th><td>',descriptor_type,'</td></tr>');
fprintf(fileID2,'%s \n',stuff);
stuff = strcat('<tr><th>Vocabulary size</th><td>',int2str(vocabulary_size),' words</td></tr>');
fprintf(fileID2,'%s \n',stuff);
stuff = '<tr><th>Vocabulary fraction</th><td>XXX</td></tr>';
fprintf(fileID2,'%s \n',stuff);
stuff = '<tr><th>SVM training data</th><td>XXX positive, XXX negative per class</td></tr>';
fprintf(fileID2,'%s \n',stuff);
stuff = '<tr><th>SVM kernel type</th><td>Linear</td></tr>';
fprintf(fileID2,'%s \n',stuff);
stuff = '</table>';
fprintf(fileID2,'%s \n',stuff);
stuff = '<h1>Prediction lists (MAP: 0.XXX)</h1>';
fprintf(fileID2,'%s \n',stuff);
stuff = '<table>';
fprintf(fileID2,'%s \n',stuff);
stuff = '<thead>';
fprintf(fileID2,'%s \n',stuff);
stuff = '<tr>';
fprintf(fileID2,'%s \n',stuff);
stuff = '<th>Airplanes (AP: 0.XXX)</th><th>Cars (AP: 0.XXX)</th><th>Faces (AP: 0.XXX)</th><th>Motorbikes (AP: 0.XXX)</th>';
fprintf(fileID2,'%s \n',stuff);
stuff = '</tr>';
fprintf(fileID2,'%s \n',stuff);
stuff = '</thead>';
fprintf(fileID2,'%s \n',stuff);
stuff = '<tbody>';
fprintf(fileID2,'%s \n',stuff);




for i = 1 :length(motorbikes)
    
    image1_file = strcat('../../Caltech4/ImageData/',strcat(A{airplanes(i)},'.jpg'));
%     image1  = imread(image1_file);
    image2_file = strcat('../../Caltech4/ImageData/',strcat(A{cars(i)},'.jpg'));
%     image2  = imread(image2_file);
    image3_file = strcat('../../Caltech4/ImageData/',strcat(A{faces(i)},'.jpg'));
%     image3  = imread(image3_file);
    image4_file = strcat('../../Caltech4/ImageData/',strcat(A{motorbikes(i)},'.jpg'));
%     image4  = imread(image4_file);a
    
%     subplot(10,4,s),imshow(image1);s=s+1;title(image1_file);
%     subplot(10,4,s),imshow(image2);s=s+1;title(image2_file);
%     subplot(10,4,s),imshow(image3);s=s+1;title(image3_file);
%     subplot(10,4,s),imshow(image4);s=s+1;title(image4_file);

  html_temp = strcat ('<tr><td><img src="', image1_file,'" /></td><td><img src="', image2_file , '" /></td><td><img src="', image3_file , '" /></td><td><img src="', image4_file, '" /></td></tr>');
  
  fprintf(fileID2,'%s \n',html_temp);
    
end

stuff = '</tbody>';
fprintf(fileID2,'%s \n',stuff);
stuff = '</table>';
fprintf(fileID2,'%s \n',stuff);
stuff = '  </body>';
fprintf(fileID2,'%s \n',stuff);
stuff = '</html>';
fprintf(fileID2,'%s \n',stuff);

fclose(fileID);
fclose(fileID2);

end
