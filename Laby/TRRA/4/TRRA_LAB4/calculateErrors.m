function [ber,evm] = calculateErrors(refsymbols,symbols,refdata,modulation)

switch modulation
    case {'BPSK','2PSK'}
        demodulator = comm.BPSKDemodulator;
        data = demodulator(symbols);
    case {'QPSK','4PSK'}
        demodulator = comm.QPSKDemodulator;
        data = demodulator(symbols);
    case '8PSK'
        demodulator = comm.PSKDemodulator(8,'PhaseOffset',0);
        data = demodulator(symbols);
    case '16PSK'
        demodulator = comm.PSKDemodulator(16,'PhaseOffset',0);
        data = demodulator(symbols);
    case '16QAM'
        data = qamdemod(symbols,16,'UnitAveragePower',true);
    case '64QAM'
        data = qamdemod(symbols,64,'UnitAveragePower',true);
    otherwise
        error('Invalid modulation type.');
end

errorRate = comm.ErrorRate;
ber = errorRate(refdata,data);
ber = ber(1);
evmcalc = comm.EVM;
evm = evmcalc(refsymbols,symbols);
