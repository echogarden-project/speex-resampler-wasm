PROJ=speex-resampler

EMCCFLAGS=-s WASM=1 -s ALLOW_MEMORY_GROWTH=1 -msimd128 -msse2 -D FLOATING_POINT=1 -D OUTSIDE_SPEEX -D USE_SSE -D USE_SSE2 -s EXPORTED_FUNCTIONS="['_malloc', '_free', '_speex_resampler_init', '_speex_resampler_init_frac', '_speex_resampler_destroy', '_speex_resampler_process_float', '_speex_resampler_process_int', '_speex_resampler_process_interleaved_float', '_speex_resampler_process_interleaved_int', '_speex_resampler_set_rate', '_speex_resampler_get_rate', '_speex_resampler_set_rate_frac', '_speex_resampler_get_ratio', '_speex_resampler_set_quality', '_speex_resampler_get_quality', '_speex_resampler_set_input_stride', '_speex_resampler_get_input_stride', '_speex_resampler_set_output_stride', '_speex_resampler_get_output_stride', '_speex_resampler_get_input_latency', '_speex_resampler_get_output_latency', '_speex_resampler_skip_zeros', '_speex_resampler_reset_mem', '_speex_resampler_strerror']" -s EXPORTED_RUNTIME_METHODS="['getValue', 'setValue', 'cwrap']" -s MODULARIZE=1 -sEXPORT_ES6=1 -s EXPORT_NAME="SpeexResampler"

all: src/resample.c
	emcc $(EMCCFLAGS) -O3 -o $(PROJ).js -I include $^

.PHONY: clean
clean:
	rm -f $(PROJ).js $(PROJ).wasm
