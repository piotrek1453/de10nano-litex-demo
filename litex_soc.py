from litex_boards.platforms import terasic_de10nano
from litex_boards.targets.terasic_de10nano import BaseSoC as LiteXBaseSoC
from litex.soc.integration.builder import Builder
from litex.soc.integration.soc import SoCRegion
from litex.build.parser import LiteXArgumentParser


class BaseSoC(LiteXBaseSoC):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        # dodatkowy region pamięci
        self.bus.add_region(
            "my_rom", SoCRegion(origin=0x50000000, size=0x1000, mode="rwx")
        )


def main():
    # Używamy platformy DE10-Nano, a nie SoC
    parser = LiteXArgumentParser(
        platform=terasic_de10nano.Platform, description="Custom DE10-Nano SoC"
    )
    # Dodaj własne argumenty
    parser.add_target_argument(
        "--extra-ip", action="store_true", help="Enable extra IP"
    )

    args = parser.parse_args()

    soc = BaseSoC(**parser.soc_argdict)
    builder = Builder(soc, **parser.builder_argdict)

    if args.build:
        builder.build(**parser.toolchain_argdict)
    if args.load:
        prog = soc.platform.create_programmer()
        prog.load_bitstream(builder.get_bitstream_filename(mode="sram"))


if __name__ == "__main__":
    main()
