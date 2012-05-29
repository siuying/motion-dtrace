#!/usr/sbin/dtrace -s
  
/* time.d */
/* http://watson1978.github.com/MacRuby-DoJo/blog/2012/04/15/dtrace/ */

#pragma D option quiet

macruby$target:::method-entry
/ copyinstr(arg0) == "String" /  /* invokes only String methods */
{
  self->starttime = walltimestamp / 1000;
}

macruby$target:::method-return
/ copyinstr(arg0) == "String" /  /* invokes only String methods */
{
  @invoked_time[copyinstr(arg0), copyinstr(arg1)] = sum((walltimestamp / 1000) - self->starttime);
}

END
{
    printf("\n");
    printf("%-10s  %-15s  %s\n", "CLASS", "METHOD", "TOTAL TIME µsec");
    printf("--------------------------------------------------------------------------------\n");
    printa("%-10s  %-15s  %@d\n", @invoked_time);
}
