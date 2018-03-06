radixSort <- function(a,  n)
{
   radix = 10;
   digits = 10;
  std::queue<long> queues[radix];
   
  for( i = 0, factor = 1; i < digits; factor *= radix, i++)
  {
    for( j = 0; j < n; j++)
      queues[((a[j]/factor)%radix)].push(a[j]);
     k = 0;
    for( j = 0; j < radix; j++)
    {
      while(!queues[j].empty())
      {
        a[k] = queues[j].front();
        queues[j].pop();
        k++;
      }
    }
  }
}

