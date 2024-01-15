--机装少女 爱丽丝
local m=88176003
function c88176003.initial_effect(c)
	--spsummon
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(88176003,0))
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetRange(LOCATION_HAND+LOCATION_MZONE)
	e1:SetCountLimit(1,88176003)
	e1:SetTarget(c88176003.settg)
	e1:SetOperation(c88176003.setop)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(88176003,1))
	e2:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e2:SetType(EFFECT_TYPE_IGNITION)
	e2:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e2:SetRange(LOCATION_HAND+LOCATION_GRAVE)
	e2:SetCountLimit(1,88276003)
	e2:SetCondition(c88176003.condition1)
	e2:SetTarget(c88176003.target1)
	e2:SetOperation(c88176003.operation1)
	c:RegisterEffect(e2)
end
function c88176003.setfilter(c)
	return c:IsSetCard(0x3592) and c:GetType()==TYPE_SPELL 
end
function c88176003.settg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	local c=e:GetHandler()
	if chkc then return chkc:IsLocation(LOCATION_GRAVE) and chkc:IsControler(tp) and c88176003.setfilter(chkc) end
	if chk==0 then return Duel.IsExistingTarget(c88176003.setfilter,tp,LOCATION_GRAVE,0,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectTarget(tp,c88176003.setfilter,tp,LOCATION_GRAVE,0,1,1,nil)
end
function c88176003.setop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_FIELD)
		e1:SetCode(EFFECT_ADD_SETCODE)
		if tc:IsCode(88178003) then
			e1:SetValue(0x3591,0x3597)
		elseif tc:IsCode(88178102) then
			e1:SetValue(0x3593,0x594)
		elseif tc:IsCode(88178309) then
			e1:SetValue(0x595,0x596)
		elseif tc:IsCode(88178601) then
			e1:SetValue(0x3598,3599)
		elseif tc:IsCode(88178801) then
			e1:SetValue(0x359a)
		elseif tc:IsCode(88178901) then
			e1:SetValue(0x359b)
		elseif tc:IsCode(88179001) then
			e1:SetValue(0x359c)
		elseif tc:IsCode(88179101) then
			e1:SetValue(0x359d)
		elseif tc:IsCode(88179201) then
			e1:SetValue(0x359e,0x559e)
		elseif tc:IsCode(88179301) then
			e1:SetValue(0x359f,0x559f)
		elseif tc:IsCode(88179401) then
			e1:SetValue(0x35a0)
		elseif tc:IsCode(88179501) then
			e1:SetValue(0x35a1)
		elseif tc:IsCode(88179601) then
			e1:SetValue(0x35a2,0x55a2,0x65a2,0x95a2)
		elseif tc:IsCode(88179701) then
			e1:SetValue(0x35a3,0x55a3)
		end
		e1:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e1:SetTarget(c88176003.codefilter)
		Duel.RegisterEffect(e1,tp)
		local e2=Effect.CreateEffect(c)
		e2:SetType(EFFECT_TYPE_FIELD)
		e2:SetCode(EFFECT_ADD_SETCODE)
		if tc:IsCode(88178003) then
			e2:SetValue(0x3597)
		elseif tc:IsCode(88178102) then
			e2:SetValue(0x594)
		elseif tc:IsCode(88178309) then
			e2:SetValue(0x596)
		elseif tc:IsCode(88178601) then
			e2:SetValue(0x3599)
		elseif tc:IsCode(88179201) then
			e2:SetValue(0x559e)
		elseif tc:IsCode(88179301) then
			e2:SetValue(0x559f)
		elseif tc:IsCode(88179601) then
			e2:SetValue(0x55a2)
		elseif tc:IsCode(88179701) then
			e2:SetValue(0x55a3)
		end
		e2:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e2:SetTarget(c88176003.codefilter)
		Duel.RegisterEffect(e2,tp)
		local e3=Effect.CreateEffect(c)
		e3:SetType(EFFECT_TYPE_FIELD)
		e3:SetCode(EFFECT_ADD_SETCODE)
		if tc:IsCode(88179601) then
			e3:SetValue(0x65a2)
		end
		e3:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e3:SetTarget(c88176003.codefilter)
		Duel.RegisterEffect(e3,tp)
		local e4=Effect.CreateEffect(c)
		e4:SetType(EFFECT_TYPE_FIELD)
		e4:SetCode(EFFECT_ADD_SETCODE)
		if tc:IsCode(88179601) then
			e4:SetValue(0x95a2)
		end
		e4:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e4:SetTarget(c88176003.codefilter)
		Duel.RegisterEffect(e4,tp)
		local e5=Effect.CreateEffect(c)
		e5:SetDescription(aux.Stringid(88176003,2))
		e5:SetCategory(CATEGORY_SPECIAL_SUMMON)
		e5:SetType(EFFECT_TYPE_IGNITION)
		e5:SetProperty(EFFECT_FLAG_CARD_TARGET)
		e5:SetRange(LOCATION_HAND+LOCATION_GRAVE)
		if tc:IsCode(88178003) then
			e5:SetLabel(0x3591,0x3597)
		elseif tc:IsCode(88178102) then
			e5:SetLabel(0x3593,0x594)
		elseif tc:IsCode(88178309) then
			e5:SetLabel(0x595,0x596)
		elseif tc:IsCode(88178601) then
			e5:SetLabel(0x3598,3599)
		elseif tc:IsCode(88178801) then
			e5:SetLabel(0x359a)
		elseif tc:IsCode(88178901) then
			e5:SetLabel(0x359b)
		elseif tc:IsCode(88179001) then
			e5:SetLabel(0x359c)
		elseif tc:IsCode(88179101) then
			e5:SetLabel(0x359d)
		elseif tc:IsCode(88179201) then
			e5:SetLabel(0x359e,0x559e)
		elseif tc:IsCode(88179301) then
			e5:SetLabel(0x359f,0x559f)
		elseif tc:IsCode(88179401) then
			e5:SetLabel(0x35a0)
		elseif tc:IsCode(88179501) then
			e5:SetLabel(0x35a1)
		elseif tc:IsCode(88179601) then
			e5:SetLabel(0x35a2,0x55a2,0x65a2,0x95a2)
		elseif tc:IsCode(88179701) then
			e5:SetLabel(0x35a3,0x55a3)
		end
		e5:SetCountLimit(1,88276003)
		e5:SetTarget(c88176003.target2)
		e5:SetOperation(c88176003.operation2)
		local e6=Effect.CreateEffect(c)
		e6:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_GRANT)
		e6:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e6:SetTarget(aux.TargetBoolFunction(Card.IsCode,88176003))
		e6:SetLabelObject(e5)
		e6:SetReset(RESET_PHASE+PHASE_END)
		Duel.RegisterEffect(e6,tp) 
		Duel.RegisterFlagEffect(e:GetHandlerPlayer(),88176003,RESET_PHASE+PHASE_END,EFFECT_FLAG_OATH,1)
	end
end
function c88176003.codefilter(e,c)
	return c:IsCode(88176003)
end
function c88176003.condition1(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFlagEffect(e:GetHandlerPlayer(),88176003)==0
end
function c88176003.filter1(c)
	return c:IsFaceup() and c:IsSetCard(0x9592)
end
function c88176003.target1(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	local c=e:GetHandler()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(tp) and c88176003.filter1(chkc) end
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and c:IsCanBeSpecialSummoned(e,0,tp,false,false)
		and Duel.IsExistingTarget(c88176003.filter1,tp,LOCATION_MZONE,0,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_FACEUP)
	Duel.SelectTarget(tp,c88176003.filter1,tp,LOCATION_MZONE,0,1,1,nil)
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,c,1,0,0)
end
function c88176003.operation1(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tc=Duel.GetFirstTarget()
	if c:IsRelateToEffect(e) then
		Duel.SpecialSummon(c,0,tp,tp,false,false,POS_FACEUP)
	end
end
function c88176003.target2(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	local c=e:GetHandler()
	if chkc then return chkc:IsLocation(LOCATION_MZONE) and chkc:IsControler(tp) end
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and c:IsCanBeSpecialSummoned(e,0,tp,false,false)
		and Duel.IsExistingTarget(Card.IsSetCard,tp,LOCATION_MZONE,0,1,nil,0x9592,e:GetLabel()) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_FACEUP)
	Duel.SelectTarget(tp,Card.IsSetCard,tp,LOCATION_MZONE,0,1,1,nil,0x9592,e:GetLabel())
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,c,1,0,0)
end
function c88176003.operation2(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tc=Duel.GetFirstTarget()
	if c:IsRelateToEffect(e) then
		Duel.SpecialSummon(c,0,tp,tp,false,false,POS_FACEUP)
	end
end