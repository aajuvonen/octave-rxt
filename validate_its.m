function validate_its
  globals
  constants

  h1 = [1000,1000,1000,10000,20000];
  h2 = [15,60,1000,1000,10000];
  dist = 0:1000;
  prob = [1,50,95];
  freq = [100,300,600];

  result = zeros(length(h1),1000,length(prob),length(freq));

  T_0 = 285;
  QNH = 1019;
  calc_k_factor;

  for i = 1:length(h1)
    for j = dist+1
      for k = 1:length(prob)
        for l = 1:length(freq)
          f = freq(l);
          result(i,j,k,l) = model_its(geod2rayd(dist(j),h1(i),h2(i)),h1(i),h2(i),prob(k));
        end
      end
    end
  end

  csvwrite ("tables/its_out100_1_1.csv",result(1,:,1,1));
  csvwrite ("tables/its_out100_1_2.csv",result(2,:,1,1));
  csvwrite ("tables/its_out100_1_3.csv",result(3,:,1,1));
  csvwrite ("tables/its_out100_1_4.csv",result(4,:,1,1));
  csvwrite ("tables/its_out100_1_5.csv",result(5,:,1,1));
  csvwrite ("tables/its_out100_50_1.csv",result(1,:,2,1));
  csvwrite ("tables/its_out100_50_2.csv",result(2,:,2,1));
  csvwrite ("tables/its_out100_50_3.csv",result(3,:,2,1));
  csvwrite ("tables/its_out100_50_4.csv",result(4,:,2,1));
  csvwrite ("tables/its_out100_50_5.csv",result(5,:,2,1));
  csvwrite ("tables/its_out100_95_1.csv",result(1,:,3,1));
  csvwrite ("tables/its_out100_95_2.csv",result(2,:,3,1));
  csvwrite ("tables/its_out100_95_3.csv",result(3,:,3,1));
  csvwrite ("tables/its_out100_95_4.csv",result(4,:,3,1));
  csvwrite ("tables/its_out100_95_5.csv",result(5,:,3,1));

  csvwrite ("tables/its_out300_1_1.csv",result(1,:,1,2));
  csvwrite ("tables/its_out300_1_2.csv",result(2,:,1,2));
  csvwrite ("tables/its_out300_1_3.csv",result(3,:,1,2));
  csvwrite ("tables/its_out300_1_4.csv",result(4,:,1,2));
  csvwrite ("tables/its_out300_1_5.csv",result(5,:,1,2));
  csvwrite ("tables/its_out300_50_1.csv",result(1,:,2,2));
  csvwrite ("tables/its_out300_50_2.csv",result(2,:,2,2));
  csvwrite ("tables/its_out300_50_3.csv",result(3,:,2,2));
  csvwrite ("tables/its_out300_50_4.csv",result(4,:,2,2));
  csvwrite ("tables/its_out300_50_5.csv",result(5,:,2,2));
  csvwrite ("tables/its_out300_95_1.csv",result(1,:,3,2));
  csvwrite ("tables/its_out300_95_2.csv",result(2,:,3,2));
  csvwrite ("tables/its_out300_95_3.csv",result(3,:,3,2));
  csvwrite ("tables/its_out300_95_4.csv",result(4,:,3,2));
  csvwrite ("tables/its_out300_95_5.csv",result(5,:,3,2));

  csvwrite ("tables/its_out600_1_1.csv",result(1,:,1,3));
  csvwrite ("tables/its_out600_1_2.csv",result(2,:,1,3));
  csvwrite ("tables/its_out600_1_3.csv",result(3,:,1,3));
  csvwrite ("tables/its_out600_1_4.csv",result(4,:,1,3));
  csvwrite ("tables/its_out600_1_5.csv",result(5,:,1,3));
  csvwrite ("tables/its_out600_50_1.csv",result(1,:,2,3));
  csvwrite ("tables/its_out600_50_2.csv",result(2,:,2,3));
  csvwrite ("tables/its_out600_50_3.csv",result(3,:,2,3));
  csvwrite ("tables/its_out600_50_4.csv",result(4,:,2,3));
  csvwrite ("tables/its_out600_50_5.csv",result(5,:,2,3));
  csvwrite ("tables/its_out600_95_1.csv",result(1,:,3,3));
  csvwrite ("tables/its_out600_95_2.csv",result(2,:,3,3));
  csvwrite ("tables/its_out600_95_3.csv",result(3,:,3,3));
  csvwrite ("tables/its_out600_95_4.csv",result(4,:,3,3));
  csvwrite ("tables/its_out600_95_5.csv",result(5,:,3,3));

endfunction
