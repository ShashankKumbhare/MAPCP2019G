load('cells.mat');
uncertanity=zeros();
for day=2:(length(cells(1,1,1,:))+1)
    uncertanity(day)=0;
    for sliceNumber=1:length(cells(1,1,:,1))
        [B,L] = bwboundaries(cells(:,:,sliceNumber,(day-1)),'noholes');
        if ~isempty(B)
            for i=1:length(B{1}(:,1))  
                for j=1:length(B{1}(1,:))                               
                    uncertanity(day)=uncertanity(day)+cells(B{1}(i,1),B{1}(1,j),sliceNumber,(day-1));                            
                end
            end
        end
    end
end

day=[0,10:2:22];
daycell=sum(sum(sum(cells(:,:,:,:))));
daycell_2=zeros();

for x=1:length(daycell)
    daycell_2(x+1)=daycell(x);
end


errorbar(day,daycell_2,uncertanity,'-o', 'MarkerFaceColor', 'b');
%plot(day,daycell_2,'-o', 'MarkerFaceColor', 'b');
title('Gompertzian Fit to Rat''s Brain Tumor growth');
xlabel('Time[days]');
ylabel('Tumor Cell Count');

