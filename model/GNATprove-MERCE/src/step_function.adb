--  copyright 2013 David MENTRE <d.mentre@fr.merce.mee.com>
--                                 -- Mitsubishi Electric R&D Centre Europe
--
--  Licensed under the EUPL V.1.1 or - as soon they will be approved by
--  the European Commission - subsequent versions of the EUPL (the
--  "Licence");
--  You may not use this work except in compliance with the Licence.
--
--  You may obtain a copy of the Licence at:
--
--    http://joinup.ec.europa.eu/software/page/eupl/licence-eupl
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the Licence is distributed on an "AS IS" basis,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
--  implied.
--
--  See the Licence for the specific language governing permissions and
--  limitations under the Licence.

package body Step_Function is
   function Min(X1, X2 : Float) return Float is
   begin
      if X1 <= X2 then return X1; else return X2; end if;
   end;

   function Get_Value(SFun : Step_Function; X: Function_Range) return Float is
   begin
      if SFun.Number_Of_Delimiters = 0 then return SFun.Default_Value; end if;

      if X < SFun.Step(1).Delimiter then return SFun.Default_Value; end if;

      for i in 1..(SFun.Number_Of_Delimiters - 1) loop
         Pragma Assert (for all j in 1..i =>
                          X >= SFun.Step(j).Delimiter);
         if X >= SFun.Step(i).Delimiter and X < SFun.Step(i + 1).Delimiter then
            return SFun.Step(i).Value;
         end if;
      end loop;

      return SFun.Step(SFun.Number_Of_Delimiters).Value;
   end Get_Value;

   procedure Restrictive_Merge(SFun1, SFun2 : in Step_Function;
                               Merge : out Step_Function) is
   begin
      null;
   end;

end Step_Function;
