#!/usr/sbin/dtrace -s
  
/* time.d */
/* http://watson1978.github.com/MacRuby-DoJo/blog/2012/04/15/dtrace/ */

#pragma D option quiet

macruby$target:::method-entry
/copyinstr(arg0) != "TopLevel"/
{
  self->starttime = walltimestamp / 1000;
}

macruby$target:::method-return
/copyinstr(arg0) != "TopLevel"/
{
  @invoked_time[copyinstr(arg0), copyinstr(arg1)] = sum((walltimestamp / 1000) - self->starttime);
}

END
{
    printf("\n");
    printf("%30s#%-30s  %s\n", "CLASS", "METHOD", "TOTAL TIME µsec");
    printf("--------------------------------------------------------------------------------\n");
    printa("%30s#%-30s  %@d\n", @invoked_time);
}
