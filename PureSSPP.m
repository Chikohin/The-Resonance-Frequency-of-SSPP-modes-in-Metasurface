function [Freq_spp,Lattice_Const] = PureSSPP(px,py,e_eff,SSPP_order)
%% 矩形晶格超表面中纯净SSPP共振模式频率与x方向、y方向周期之间关系计算的说明
% The relationship between the frequency of pure SSPP resonance mode and ...
...the period in x direction and y direction in rectangular lattice metasurface
% Author: cuizijian_harbin@163.com
% Data: 20240521整理
% 如需使用，请引用相关文献：[10.1109/TTHZ.2021.3095440]

% 输入                                            % Input
% px/py: 晶格常数                                 % The lattice constant in x/y direction;
% e_eff: 等效介电常数                             % Effective relative permittivity;
% SSPP_order: SSPP的阶数，以[m,n]形式输入         % SSPP order;

% 输出                                            % Return
% Freq: SSPP共振频率                              % Resonance frequency of the SSPP
% Lattice_Const: 对应的晶格常数                   % The period of units

% 此函数支持两种情况的计算:
% 1. 单一变量研究，即px和py中只存在一个向量，另一个为常数；
% 2. px = py 情况，二者都为向量
% This function supports single-variable research, that is, px and py ...
...have only one vector, and the other is a constant; or px = py.

%% Calaulation 
% 光速 light speed
c = 3e8; 
% 阶数分配 SSPP order
m = SSPP_order(:,1);
n = SSPP_order(:,2);
% px和py变量判断
    if length(px) == length(py)
        Freq_spp = (c.*sqrt(m^2+(px./py).^2.*n^2))./(px.*sqrt(e_eff));
        Lattice_Const = py;
        return
    end

    if length(px)>1 ~= length(py)>1
        error('输入不符合要求; The input does not meet the requirements')
    end
% 固定py情况计算
    if length(py) == 1
        Freq_spp = (c.*sqrt(m^2+(px./py).^2.*n^2))./(px.*sqrt(e_eff));
        Lattice_Const = px;
    end
% 固定px情况计算
    if length(px) == 1
        Freq_spp = (c.*sqrt(m^2+(px./py).^2.*n^2))./(px.*sqrt(e_eff));
        Lattice_Const = py;
    end

end

