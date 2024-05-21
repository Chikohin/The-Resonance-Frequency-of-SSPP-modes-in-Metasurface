function [Freq_spp,Lattice_Const] = PureSSPP(px,py,e_eff,SSPP_order)
%% ���ξ��񳬱����д���SSPP����ģʽƵ����x����y��������֮���ϵ�����˵��
% The relationship between the frequency of pure SSPP resonance mode and ...
...the period in x direction and y direction in rectangular lattice metasurface
% Author: cuizijian_harbin@163.com
% Data: 20240521����
% ����ʹ�ã�������������ף�[10.1109/TTHZ.2021.3095440]

% ����                                            % Input
% px/py: ������                                 % The lattice constant in x/y direction;
% e_eff: ��Ч��糣��                             % Effective relative permittivity;
% SSPP_order: SSPP�Ľ�������[m,n]��ʽ����         % SSPP order;

% ���                                            % Return
% Freq: SSPP����Ƶ��                              % Resonance frequency of the SSPP
% Lattice_Const: ��Ӧ�ľ�����                   % The period of units

% �˺���֧����������ļ���:
% 1. ��һ�����о�����px��py��ֻ����һ����������һ��Ϊ������
% 2. px = py ��������߶�Ϊ����
% This function supports single-variable research, that is, px and py ...
...have only one vector, and the other is a constant; or px = py.

%% Calaulation 
% ���� light speed
c = 3e8; 
% �������� SSPP order
m = SSPP_order(:,1);
n = SSPP_order(:,2);
% px��py�����ж�
    if length(px) == length(py)
        Freq_spp = (c.*sqrt(m^2+(px./py).^2.*n^2))./(px.*sqrt(e_eff));
        Lattice_Const = py;
        return
    end

    if length(px)>1 ~= length(py)>1
        error('���벻����Ҫ��; The input does not meet the requirements')
    end
% �̶�py�������
    if length(py) == 1
        Freq_spp = (c.*sqrt(m^2+(px./py).^2.*n^2))./(px.*sqrt(e_eff));
        Lattice_Const = px;
    end
% �̶�px�������
    if length(px) == 1
        Freq_spp = (c.*sqrt(m^2+(px./py).^2.*n^2))./(px.*sqrt(e_eff));
        Lattice_Const = py;
    end

end

