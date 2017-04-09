class Cfg3DEN
{
	class Object
	{
		class AttributeCategories
		{
			class ecf_attributes
			{
				displayName = QUOTE(ECF Attributes);
				collapsed = 1;

				class Attributes
				{
					class StaticAnimation
					{
						property = QGVAR(staticAnimation);
						control = QUOTE(Edit);

						displayName = QUOTE(Ambient Animation);
						tooltip = QUOTE(Set animation for start);

						expression = "[_this, _value] call editor_fnc_staticAnimation;";
						typeName = QUOTE(STRING);
						condition = QUOTE(objectBrain);
						defaultValue = "";
					};

					class StaticAnimationCombat
					{
						property = GQVAR(staticAnimationCombat);
						control = QUOTE(Checkbox);

						displayName = QUOTE(React to Combat);
						tooltip = QUOTE(Whether the unit should react to combat);

						expression = "_this setVariable ['ECF_staticAnimationCombat', _value];";
						typeName = QUOTE(BOOL);
						condition = QUOTE(objectBrain);
						defaultValue = QUOTE(false);
					};
				};
			};
		};
	};
};