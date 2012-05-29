#!/usr/sbin/dtrace -s

#pragma D option quiet

macruby$target:::method-entry
{
    self->starttime = walltimestamp / 1000;
}

macruby$target:::method-return
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
