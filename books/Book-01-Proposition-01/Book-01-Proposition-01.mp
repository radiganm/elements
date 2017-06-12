%% Book-01-Proposition-01.mp
%% Mac Radigan

  prologues := 3; % EPS
  u := 1mm;

  outputtemplate := "figures/%j-%c.mps";

  beginfig(1);

    s=10u;
    z0=(s,0) rotated 90;
    z1=z0 rotated 120; z2 = z0 rotated -120;
    draw z0--z1--z2--cycle withcolor black;

    r=2*abs(z0-z1);
    draw fullcircle scaled r shifted z1 withcolor black;
    draw fullcircle scaled r shifted z2 withcolor black;

    label.top("C", z0);
    label.llft("A", z1);
    label.lrt("B", z2);

  endfig;

  end;

%% *EOF*
