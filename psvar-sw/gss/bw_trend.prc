proc(1) = bw_trend(x,bw);
 local xmean, z, tmp, nobs,t,dt,bw_weight,trend;
 xmean = missmat(rows(x),1);
 z = seqa(1,1,rows(x));
 tmp = packr(x~z);
 x = tmp[.,1];
 z = tmp[.,2];
 nobs = rows(x);
 tmp = zeros(nobs,1);
 trend = seqa(1,1,nobs);
 for t (1,nobs,1);
 	dt = (trend-t)/bw_bw;
  bw_weight = (15/16)*((1-dt.^2).^2);   @ Bi-Weight @
  bw_weight = bw_weight.*(abs(dt).< 1);
  bw_weight = bw_weight/sumc(bw_weight);
  tmp[t]=bw_weight'x;
 endfor;
 xmean[z[1]:z[rows(z)]]=tmp;
retp(xmean);
endp;