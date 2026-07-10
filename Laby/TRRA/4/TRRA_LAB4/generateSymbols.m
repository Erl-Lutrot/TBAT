function [symbols,data,constellation] = generateSymbols(num,modulation)

rng(3);

switch modulation
    case {'BPSK','2PSK'}
        data = randi([0 1],num,1);
        symbols = pskmod(data,2);
        constellation = pskmod(0:1,2);
    case {'QPSK','4PSK'}
        data = randi([0 3],num,1);
        symbols = pskmod(data,4,pi/4,'gray');
        constellation = pskmod(0:3,4,pi/4,'gray');
    case '8PSK'
        data = randi([0 7],num,1);
        symbols = pskmod(data,8,0,'gray');
        constellation = pskmod(0:7,8,0,'gray');
    case '16PSK'
        data = randi([0 15],num,1);
        symbols = pskmod(data,16,0,'gray');
        constellation = pskmod(0:15,16,0,'gray');
    case '16QAM'
        data = randi([0 15],num,1);
        symbols = qammod(data,16,'UnitAveragePower',true);
        constellation = qammod(0:15,16,'UnitAveragePower',true);
    case '64QAM'
        data = randi([0 63],num,1);
        symbols = qammod(data,64,'UnitAveragePower',true);
        constellation = qammod(0:63,64,'UnitAveragePower',true);
    otherwise
        error('Invalid modulation type.');
end
