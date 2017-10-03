p = [-1 -0.83 -0.66 -0.49 -0.33 -0.16 0.16 0.33 0.49 0.66 0.83 1 -1 -0.83 -0.66 -0.49 -0.33 -0.16 0.16 0.33 0.49 0.66 0.83 1;
     -0.66 -0.49 -0.33 -0.16 0.16 0.33 0.49 0.66 0.83 1 -1 -0.83 -0.66 -0.49 -0.33 -0.16 0.16 0.33 0.49 0.66 0.83 1 -1 -0.83;
     -0.33 -0.16 0.16 0.33 0.49 0.66 0.83 1 -1 -0.83 -0.66 -0.49 -0.49 -0.33 -0.16 0.16 0.33 0.49 0.66 0.83 1 -1 -0.83 -0.66;
     -0.16 0.16 0.33 0.49 0.66 0.83 1 -1 -0.83 -0.66 -0.49 -0.33 -0.16 0.16 0.33 0.49 0.66 0.83 1 -1 -0.83 -0.66 -0.49 -0.33;
     0.33 0.49 0.66 0.83 1 -1 -0.83 -0.66 -0.49 -0.33 -0.16 0.16 0.33 0.49 0.66 0.83 1 -1 -0.83 -0.66 -0.49 -0.33 -0.16 0.16;
     0.66 0.83 1 -1 -0.83 -0.66 -0.49 -0.33 -0.16 0.16 0.33 0.49 0.49 0.66 0.83 1 -1 -0.83 -0.66 -0.49 -0.33 -0.16 0.16 0.33;
     1 -1 -0.83 -0.66 -0.49 -0.33 -0.16 0.16 0.33 0.49 0.66 0.83 0.83 1 -1 -0.83 -0.66 -0.49 -0.33 -0.16 0.16 0.33 0.49 0.66];

t = [-1 -0.83 -0.66 -0.49 -0.33 -0.16 0.16 0.33 0.49 0.66 0.83 1 -2 -1.83 -1.66 -1.49 -1.33 -1.16 1.16 1.33 1.49 1.66 1.83 2];

net = newff (minmax (p), [4 1], {'tansig', 'purelin'}, 'traingd');
net.trainParam.epochs = 700000;
[net, tr] = train (net, p, t);
a = sim (net, p);
e = t - a;